<?php

include_once ('connect.php');
class baza extends DB {

function language ($language)


{
    $con = $this->connect();
    $language = mysqli_real_escape_string($con, $language);
    $con->close();
   return $language;
}


function language_current ($language) {
    $con = $this->connect();
    $sql = $con->prepare('SELECT id, lang, jelo, opis, sastojci, kategorija, datum, rezultat_txt, filter_txt, first_page, last_page FROM jezik where id = ?');

    $sql->bind_param("s", $language);

    $sql->execute();
    $result = $sql->get_result();
    $cur_lang = 'hrvatski';
    $lang_id = 1;
    $array = array(
        'id'  => 1,
        'lang' => "hrvatski");
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $array['id'] = $row['id'];
            $array['lang'] = $row['lang'];
            $array['jelo'] = $row['jelo'];
            $array['opis'] = $row['opis'];
            $array['sastojci'] = $row['sastojci'];
            $array['kategorija'] = $row['kategorija'];
            $array['datum'] = $row['datum'];
            $array['rezultat_txt'] = $row['rezultat_txt'];
            $array['filter_txt'] = $row['filter_txt'];
            $array['first_page'] = $row['first_page'];
            $array['last_page'] = $row['last_page'];
        }
    }
    $sql->close();
    $con->close();
return $array;

}

function where ($cat = null, $ing = null, $null = null, $tag = null) {

    $category = '%';
    $ingredients = '%';
    $tags = '%';
    $ingredients = '%';
    $query = "";
$con = $this->connect();

    if (isset($cat)) {
        $category = mysqli_real_escape_string($con, $category);
        $category = str_replace(" ", "%", trim($cat));
        if (empty($category)) {
            $category = "%";
        }
        $query = " (a.category_id like '" . $category . "') ";
        $query = str_replace(",", "' OR a.category_id like '", $query);
    }
    if (isset($null)) {
        $query .= " OR a.category_id IS NULL ";
    }
    if (isset($ing)) {
        $ingredients = mysqli_real_escape_string($con, $ingredients);
        $ingredients = str_replace(" ", "%", trim($ing));
        if (empty($ingredients)) {
            $ingredients = "%";
        }
        $query .= " (c.opis like '%" . $ingredients . "%') ";
        $query = str_replace(",", "%' OR c.opis like '", $query);
    }
    if (isset($tag)) {
        $tags = mysqli_real_escape_string($con, $tags);
        $tags = str_replace(" ", "", trim($tag));
        if (empty($tags)) {
            $tags = "%";
        }
        $query .= " (d.id like '" . $tags . "')";
        $query = str_replace(",", "' OR d.id like '", $query);
    }
    $query = str_replace(")  (", ") AND (", $query);
    $query = str_replace("L  (", "L AND (", $query);
    if (!empty($query)) {
        $query = " WHERE " . $query;
    }
    $query = trim(trim($query,"'"),'"');
$con->close();
    return $query;
}

function sql_query ($cur_lang, $query, $start_from = null, $record_per_page = null) {
    $con = $this->connect();

$limit = (isset($start_from) && isset($record_per_page)) ? $limit = " LIMIT " . $start_from . "," . $record_per_page : $limit = "";
$limit = mysqli_real_escape_string($con, $limit);
$con->close();
    $sql_query =
        "SELECT
    a.id AS jeloID, a.delete_food, a.date_deleted, a.status, a.tag_id, a.category_id, a.ingredients_id,
    b.id AS jezikID, b.naziv, b.jelo_id, b.opis AS jelo_opis,
    c.id AS ingredientsID, c.opis AS ingredients_opis, c.slug_ing_id,
    d.id AS tagID, d.opis AS tag_opis, d.slug_tag_id,
    e.id AS categoryID, e.opis AS category_opis, e.slug_cat_id,
    f.id AS slug_cat_ID, f.slug AS slugCAT,
    g.id AS slug_tag_ID, g.slug AS slugTAG,
    h.id AS slug_ing_ID, h.slug AS slugING
FROM
    jelo a
INNER JOIN " . $cur_lang . " b ON
    a.id = b.jelo_id
INNER JOIN ingredients_" . $cur_lang . " c ON
    a.ingredients_id = c.id
INNER JOIN tag_" . $cur_lang . " d ON
    a.tag_id = d.id
INNER JOIN slug_ingredients h ON
    c.slug_ing_id = h.id
INNER JOIN slug_tags g ON
    d.slug_tag_id = g.id
LEFT JOIN category_" . $cur_lang . " e ON
    e.id = a.category_id
LEFT JOIN slug_category f ON
    e.slug_cat_id = f.id " . $query . $limit;

    return $sql_query;

}

function pagination ($page_query, $record_per_page, $page, $first, $last){
    $con = $this->connect();
    $page_result = mysqli_query($con, $page_query);
    $total_records = mysqli_num_rows($page_result);
    $total_pages = ceil($total_records / $record_per_page);

    $start_loop = $page;

    $difference = $total_pages - $page;

    if ($difference <= $record_per_page) {
        $start_loop = $total_pages - $record_per_page;

    }
    $end_loop = $start_loop + $record_per_page;

if ($page == 1 && $difference >= $record_per_page) {$end_loop = $start_loop + ($record_per_page + 1);}

    $url = $_SERVER['REQUEST_URI'];
    $parsed = parse_url($url);


    $string = "";
    if (array_key_exists('query', $parsed)) {
        $parsed_query = $parsed['query'];


        parse_str($parsed_query, $params);
        unset($params['page']);
        $string = http_build_query($params);

    }

    if ($page > 1) {
        echo "<a href='?" . $string . "&page=1'>" . ucfirst(trim($first)) . "</a>";
        echo "<a href='?" . $string . "&page=" . ($page - 1) . "'><<</a>";
    }


    for ($i = 1; $i <= $end_loop; $i++) {
        echo "<a href='?" . $string . "&page=" . $i . "'>" . $i . "</a>";
    }

    if ($page < $end_loop) {
        echo "<a href='?" . $string . "&page=" . ($page + 1) . "'>>></a>";
        echo "<a href='?" . $string . "&page=" . $total_pages . "'>" . ucfirst(trim($last)) . "</a>";
    }
    return 0;
}

    function is_timestamp($timestamp)
    {
        $check = (is_int($timestamp) OR is_float($timestamp))
            ? $timestamp
            : (string) (int) $timestamp;
        return  ($check === $timestamp)
            AND ( (int) $timestamp <=  PHP_INT_MAX)
            AND ( (int) $timestamp >= ~PHP_INT_MAX);
    }

    function diffTime ($time){

   if ($this->is_timestamp($time)){
      echo "UPDATE jelo SET  delete_food = 0, date_deleted = NOW(), status = 'modified' WHERE date_deleted <= '" . date('Y-m-d H:i:s', $time) . "' AND delete_food = 1";
   } else {
       echo "Invalid UNIX timestamp";
   }
    return 0;
    }



}

