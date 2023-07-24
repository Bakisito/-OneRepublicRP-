var container = document.getElementById("container");
var imageView = document.getElementById("paper");

var currentBookName = "comic_book_1";
var currentPage = 1;

$(imageView).on("click", function(event) { //To switch pages between left and right
    var x = event.pageX - this.offsetLeft;
    var isLeft = x < this.width / 2 ? true : false;
    if (isLeft) {
        changePage(currentPage - 1);
    } else {
        changePage(currentPage + 1);
    }
});

$(document).on('keydown', function(event) {
    if (event.keyCode === 27) //Close the book on ESCAPE
    {
        CloseBook();
    }
});

$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var action = event.data.action;
        if (action === "open") {
            OpenBook(event.data.book);
        } else {
            CloseBook();
        }
    })
});

function OpenBook(bookName) {
    currentBookName = bookName;
    changePage(1);
    container.style.visibility = "visible";
}

function CloseBook() {
    container.style.visibility = "hidden";
    $.post('https://qb-paperscript/close');
}

function changePage(page) { //Switch to a new page
    imageView.src = "papers/" + currentBookName + "/" + page + ".jpg";
    currentPage = page;
}

function onImageError() {
    changePage(1); //If the current page is invalid return to the first page
}