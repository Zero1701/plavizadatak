<table>
    <tr>
        <th><?php echo ucfirst(trim($cl['jelo'])); ?></th>
        <th>Tag</th>
        <th>T-slug</th>
        <th>Tag <?php echo trim($cl['opis']); ?></th>
        <th><?php echo ucfirst(trim($cl['opis'])); ?></th>
        <th><?php echo ucfirst(trim($cl['sastojci'])); ?></th>
        <th>I-slug</th>
        <th><?php echo ucfirst(trim($cl['kategorija'])); ?></th>
        <th>C-slug</th>
        <th><?php echo ucfirst(trim($cl['datum'])); ?></th>
    </tr>
    <?php
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>" . $row['naziv'] . "</td>";
            echo "<td>" . $row['tagID'] . "</td>";
            echo "<td>" . $row['slugTAG'] . "</td>";
            echo "<td>" . $row['tag_opis'] . "</td>";
            echo "<td>" . $row['jelo_opis'] . "</td>";
            echo "<td>" . $row['ingredients_opis'] . "</td>";
            echo "<td>" . $row['slugING'] . "</td>";
            echo "<td>" . $row['category_opis'] . "</td>";
            echo "<td>" . $row['slugCAT'] . "</td>";
            $date = date_create($row['date_deleted']);
            echo "<td>" . date_format($date, 'H:i:s d.m.Y.') . "</td>";
            echo "</tr>";
        }
    } else {
        echo "0 results";
    }
    $sql->close();
    ?>
</table>