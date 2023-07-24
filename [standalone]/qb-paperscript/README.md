# HOW TO INSTALL
Move the comic_book image to your inventory images

Add these lines to qb-core/shared.lua:

    -- Comic Books
	['comic_book_1'] 			 = {['name'] = 'comic_book_1', 				['label'] = 'News Paper', 				['weight'] = 0, 		['type'] = 'item', 		['image'] = 'comic_book.png', 		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'The Daily News Paper.'},
	['comic_book_2'] 			 = {['name'] = 'comic_book_2', 				['label'] = 'Batman Comic Book', 				['weight'] = 0, 		['type'] = 'item', 		['image'] = 'comic_book.png', 		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Batman Comic Book.'},

To add more comic books, copy one of the line above and paste a new one in qb-core/shared.lua
change the name to comic_book_YourCurrentBookNumber
change the label to whatever you want
change the description to whatever you want
change the image to whatever you want, make sure you add the new image to your inventory icons

create a new folder inside this script client/html/papers/comic_book_YourCurrentBookNumber
add the comic book pages inside the folder labeled with their page numbers from 1 till 100 or whatever
add comic_book_YourCurrentBookNumber to the config.lua

add comic_book_YourCurrentBookNumber to your shop so you can purchase it

Example For qb-shops:
		[13] = {
            name = "comic_book_1",
            price = 1,
            amount = 100,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "comic_book_2",
            price = 5,
            amount = 100,
            info = {},
            type = "item",
            slot = 14,
        },