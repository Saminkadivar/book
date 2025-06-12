<?php
// Check if the constant is already defined
if (!defined('BOOK_IMAGE_SITE_PATH')) {
    define('BOOK_IMAGE_SITE_PATH', 'img/books/');
}

require('header.php');
$defaultImg = 'images/default-book.png';
?>

<!-- NEW ARRIVALS CONTAINER -->
<div class="container mb-5 mt-5">
    <h2 class="fs-2 fw-bold text-center"> New Arrivals</h2>
    <hr />
    <div class="row gy-3 text-center ">
        <?php
        $orderBy = 'id desc';
        $getProduct = getProduct($con, 4, '', '', $orderBy); // ← Your function must already be using PDO
        foreach ($getProduct as $list) {
            $img = BOOK_IMAGE_SITE_PATH . $list['img'];
        ?>
        <div class="col-6 col-md-4 col-lg-3">
            <div class="card mt-3 product">
                <img id="card-img" alt="Book Image" src="<?php echo $img ?>" class="card-img-top" />
                <div class="overlay">
                    <a href="book.php?id=<?php echo $list['id'] ?>" class="btn rent-btn">Rent</a>
                </div>
            </div>
            <div id="bookCardName">
                <a href="book.php?id=<?php echo $list['id'] ?>"
                   class="card-text text-uppercase text-break fw-bold text-decoration-none">
                    <?php echo $list['name'] ?>
                </a>
                <p class="card-text">Price- ₹<?php echo $list['rent'] ?> Per day</p>
            </div>
        </div>
        <?php } ?>
    </div>
</div>

<!-- MOST VIEWED CONTAINER -->
<div class="container mb-5 mt-5">
    <h2 class="fs-2 fw-bold text-center">Most Viewed</h2>
    <hr />
    <div class="row gy-3 text-center ">
        <?php
        function getBook($con)
        {
            $stmt = $con->prepare("SELECT * FROM books WHERE best_seller = 1 LIMIT 8");
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }

        $getBook = getBook($con);
        foreach ($getBook as $list) {
            $img = BOOK_IMAGE_SITE_PATH . $list['img'];
        ?>
        <div class="col-6 col-md-4 col-lg-3">
            <div class="card border-dark mt-3 shadow-sm product">
                <img id="card-img" alt="Book Image" src="<?php echo $img ?>" class="card-img-top rounded"
                     height="396rem" width="260rem" />
                <div class="overlay">
                    <a href="book.php?id=<?php echo $list['id'] ?>" class="btn-lg text-decoration-none rent-btn btn-primary">Rent</a>
                </div>
            </div>
            <div id="bookCardName">
                <a href="book.php?id=<?php echo $list['id'] ?>"
                   class="card-text text-uppercase text-break fw-bold text-decoration-none">
                    <?php echo $list['name'] ?>
                </a>
                <p class="card-text">Price- ₹<?php echo $list['rent'] ?> Per day</p>
            </div>
        </div>
        <?php } ?>
    </div>
</div>

<!-- STYLE BLOCK (unchanged) -->
<style>
/* same CSS as provided */
</style>

<?php require('footer.php'); ?>
