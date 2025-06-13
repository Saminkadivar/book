<?php
// Define constants if not defined
if (!defined('BOOK_IMAGE_SITE_PATH')) {
    define('BOOK_IMAGE_SITE_PATH', 'img/books/');
}

require('header.php');
$defaultImg = 'images/default-book.png';

function getProduct($con, $limit = 4, $category = '', $search = '', $orderBy = 'id DESC') {
    $query = "SELECT * FROM books ORDER BY $orderBy LIMIT :limit";
    $stmt = $con->prepare($query);
    $stmt->bindValue(':limit', (int)$limit, PDO::PARAM_INT);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getBook($con) {
    $sql = "SELECT * FROM books WHERE best_seller = 1 LIMIT 8";
    $stmt = $con->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<!-- New Arrivals Container -->
<div class="container mb-5 mt-5">
    <h2 class="fs-2 fw-bold text-center"> New Arrivals</h2>
    <hr />
    <div class="row gy-3 text-center">
        <?php
        $getProduct = getProduct($con);
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
                <div class="bookCardName">
                    <a href="book.php?id=<?php echo $list['id'] ?>" class="card-text text-uppercase text-break fw-bold text-decoration-none">
                        <?php echo htmlspecialchars($list['name']) ?>
                    </a>
                    <p class="card-text">Price - ₹<?php echo $list['rent'] ?> Per day</p>
                </div>
            </div>
        <?php } ?>
    </div>
</div>

<!-- Most Viewed Container -->
<div class="container mb-5 mt-5">
    <h2 class="fs-2 fw-bold text-center">Most Viewed</h2>
    <hr />
    <div class="row gy-3 text-center">
        <?php
        $getBook = getBook($con);
        foreach ($getBook as $list) {
            $img = BOOK_IMAGE_SITE_PATH . $list['img'];
        ?>
            <div class="col-6 col-md-4 col-lg-3">
                <div class="card border-dark mt-3 shadow-sm product">
                    <img id="card-img" alt="Book Image" src="<?php echo $img ?>" class="card-img-top rounded" height="396rem" width="260rem" />
                    <div class="overlay">
                        <a href="book.php?id=<?php echo $list['id'] ?>" class="btn-lg text-decoration-none rent-btn btn-primary">Rent</a>
                    </div>
                </div>
                <div class="bookCardName">
                    <a href="book.php?id=<?php echo $list['id'] ?>" class="card-text text-uppercase text-break fw-bold text-decoration-none">
                        <?php echo htmlspecialchars($list['name']) ?>
                    </a>
                    <p class="card-text">Price - ₹<?php echo $list['rent'] ?> Per day</p>
                </div>
            </div>
        <?php } ?>
    </div>
</div>

<style>
.card {
    border: none;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease-in-out;
    position: relative;
}

.card:hover {
    transform: scale(1.05);
}

.card-img-top {
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    height: 380px;
    object-fit: cover;
    transition: opacity 0.3s ease-in-out;
}

.card:hover .card-img-top {
    opacity: 0.8;
}

.overlay {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    border-radius: 15px;
    display: flex;
    justify-content: center;
    align-items: center;
    visibility: hidden;
}

.card:hover .overlay {
    visibility: visible;
    animation: fade 0.5s;
}

.rent-btn {
    background-color: #34495e;
    color: #ffffff;
    font-weight: bold;
    padding: 10px 20px;
    border-radius: 25px;
    text-transform: uppercase;
    transition: background 0.3s ease-in-out;
}

.rent-btn:hover {
    background-color: #ffffff;
    color: #34495e;
}

.bookCardName {
    padding: 15px;
    background: #ffffff;
    text-align: center;
    text-transform: uppercase;
    border-bottom-left-radius: 15px;
    border-bottom-right-radius: 15px;
}

.bookCardName a {
    font-size: 1.1rem;
    color: #2c3e50;
    font-weight: bold;
    transition: color 0.3s ease-in-out;
}

.bookCardName a:hover {
    color: #f1c40f;
}

.card-text {
    color: #7f8c8d;
    font-size: 1rem;
}

@keyframes fade {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}
</style>

<?php require('footer.php'); ?>
