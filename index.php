<!doctype html>

<html lang="hr">
<head>
    <meta charset="utf-8">

    <title>Jelovnik</title>
    <meta name="description" content="The HTML5 Herald">
    <meta name="author" content="SitePoint">

    <link rel="stylesheet" href="css/styles.css?v=1.0">


    <script src="/jquery-3.3.1.min.js"></script>

    <style>
        table, th, td {
            border: 1px solid black;
        }

        a {
            padding: 8px 16px;
            border: 1px solid #ccc;
            color: #333;
            font-weight: bold;
        }

        input[type=text], select {

            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 8px 10px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }

    </style>
</head>

<body>
<p><a href=".?lang=1">Hrvatski</a></p>
<p><a href=".?lang=2">Engleski</a></p>

<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include ('db.php');

$db = new baza();
$con = $db->connect();
if (isset($_GET['diff_time'])) { $db->diffTime($_GET['diff_time']); }

$language = (isset($_GET['lang']) && is_numeric($_GET['lang'])) ?  $language = $db->language($_GET['lang']) : $language = $db->language('1');

$record_per_page = (isset($_GET['per_page']) && is_numeric($_GET['per_page']) && $_GET['per_page'] > 0) ? $record_per_page = $_GET['per_page'] : $record_per_page = 1;
$page = (isset($_GET['page']) && is_numeric($_GET['page']) && $_GET['page'] > 0) ? $page = $_GET['page'] : $page = 1;
$start_from = ($page - 1) * $record_per_page;

$cl = $db->language_current($language);
$lang_id = $cl['id'];
$cur_lang = $cl['lang'];
?>
<div class="form_result">
    <?php include (($_SERVER["DOCUMENT_ROOT"]) .'\forma.php');?>
</div>
<?php





$category = isset($_GET['category']) ? str_replace("'", "", $_GET['category']) : $category = null;
$null = isset($_GET['null']) ? $_GET['null'] : $null = null;
$ingredients = isset($_GET['ingredients']) ? str_replace("'", "", $_GET['ingredients']) : $ingredients = null;
$tags = isset($_GET['tags']) ? str_replace("'", "", $_GET['tags']) : $tags = null;

$query = $db->where($category, $ingredients, $null, $tags);


$sql_query = $db->sql_query($cur_lang, $query, $start_from, $record_per_page);

$sql = $con->prepare($sql_query);

$sql->execute();
$result = $sql->get_result();

?>
<?php include (($_SERVER["DOCUMENT_ROOT"]) .'\table.php');?>

<div style="text-align:center">
    <br/>
    <?php
    $page_query = $db->sql_query($cur_lang, $query);
$db->pagination($page_query, $record_per_page, $page, $cl['first_page'], $cl['last_page']);
    ?>
</div>
<br/><br/>
<?php mysqli_close($con); ?>
<script>
    function submitForm() {
        $.ajax({
            type: 'GET', url: 'forma_ajax.php', data: $('#abc').serialize(), success: function (response) {
                $('.form_result').html(response);
            }
        });

        return false;
    }
</script>
</body>
</html>