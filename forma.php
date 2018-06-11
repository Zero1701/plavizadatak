<form id="abc" method="get" action="<?php echo $_SERVER['PHP_SELF']; ?>">
<input type="hidden" name="lang" value="<?php echo $language; ?>">
<label><?php echo ucfirst(trim($cl['rezultat_txt'])); ?>:</label><br>
<select name="per_page">
        <option value="1" <?php if (isset($_GET['per_page']) && $_GET['per_page'] == 1) { ?> selected="selected" <?php } ?>>1</option>
        <option value="5" <?php if (isset($_GET['per_page']) && $_GET['per_page'] == 5) { ?> selected="selected" <?php } ?>>5</option>
        <option value="10" <?php if (isset($_GET['per_page']) && $_GET['per_page'] == 10) { ?> selected="selected" <?php } ?>>10</option>
        <option value="100" <?php if (isset($_GET['per_page']) && $_GET['per_page'] == 100) { ?> selected="selected" <?php } ?>>100</option>
        <option value="1000" <?php if (isset($_GET['per_page']) && $_GET['per_page'] == 1000) { ?> selected="selected" <?php } ?>>1000</option>
    </select>

<label><?php echo ucfirst(trim($cl['filter_txt'])); ?>:</label><br>

<select multiple="multiple" name="with[]" onclick="return submitForm();">
    <?php if (isset($_GET['with'])) { ?>
        <option <?php if (in_array("ingredient", $_GET['with'])) { ?> selected="selected" <?php } ?>
            value="ingredient"><?php echo ucfirst(trim($cl['sastojci'])); ?></th>
        </option>
        <option <?php if (in_array("cat", $_GET['with'])) { ?> selected="selected" <?php } ?> value="cat"><?php echo ucfirst(trim($cl['kategorija'])); ?>
        </option>
        <option <?php if (in_array("tag", $_GET['with'])) { ?> selected="selected" <?php } ?> value="tag">Tag
        </option>
    <?php } else { ?>
        <option value="ingredient"><?php echo ucfirst(trim($cl['sastojci'])); ?></option>
        <option value="cat"><?php echo ucfirst(trim($cl['kategorija'])); ?></option>
        <option value="tag">Tag</option>
    <?php }
    ?>
</select>
<br>
<?php if (isset($_GET['with'])) { ?>
    <?php if (in_array("ingredient", $_GET['with'])) { ?>
        <?php echo ucfirst(trim($cl['sastojci'])); ?>: <input type="text" name="ingredients" <?php if (isset($_GET['ingredients'])) { ?>
                         value="<?php echo $_GET['ingredients'];
                         } ?>"><br>
    <?php } ?>
    <?php if (in_array("cat", $_GET['with'])) { ?>
        <?php echo ucfirst(trim($cl['kategorija'])); ?>: <input type="text" name="category" <?php if (isset($_GET['category'])) { ?>
                           value="<?php echo $_GET['category'];
                           } ?>">
        <label class="container">NULL: <input type="checkbox"
                                                 name="null" <?php if (isset($_GET['null'])) { ?> checked="checked" <?php } ?>>
        <span class="checkmark"></span><br>
    <?php } ?>
    <?php if (in_array("tag", $_GET['with'])) { ?>
        </label><br>
        Tag: <input type="text" name="tags" <?php if (isset($_GET['tags'])) { ?> value="<?php echo $_GET['tags'];
        }
        ?>">
    <?php } ?>
<?php } ?>
<input type="submit" name="submit" value="Submit"/><br/>
</form>