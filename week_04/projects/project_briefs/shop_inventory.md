### Shop Inventory

Build an app which allows a shopkeeper to track their shop's inventory. This is not an app which the customer will see, it is an admin/management app for the shop workers.

#### Inspired by
eBay, Amazon (back end only), Magento

#### MVP

* The inventory should track individual products, including a name, description, stock quantity, buying cost, and selling price.
* The inventory should track manufacturers, including a name and any other appropriate details.
* The shop can sell anything you like, but you should be able to create, edit and delete manufacturers and products separately.
  * This might mean that it makes more sense for a car shop to track makes and models of cars. Or a bookstore might sell books by author, or by publisher, and not by manufacturer. You are free to name classes and tables as appropriate to your project.
* Show an inventory page, listing all the details for all the products in stock in a single view.
* As well as showing stock quantity as a number, the app should visually highlight "low stock" and "out of stock" items to the user.

##### User stories / Acceptance Criteria - MVP

###### Manage stock

_As a shop keeper_<br />
_I want to be able to and and view accurate information about my stock_<br />
_So that I can keep track of what I have in stock_<br />

**Acceptance Criteria:** Shop keepers should be able to add new items to their list of stock. <br />
**Acceptance Criteria:** Shop keepers should be able to edit details of existing stock items in their list of stock. <br />
**Acceptance Criteria:** Shop keepers should be able to delete items from their list of stock.

###### Manage manufacturers

_As a shop keeper_<br />
_I want to be able to see accurate information about the manufacturers whos stock I hold_<br />
_So that I can keep track of details about my manufacturers_<br />

**Acceptance Criteria:** Shop keepers should be able to add new manufacturers. <br />
**Acceptance Criteria:** Shop keepers should be able to remove manufacturers.
**Acceptance Criteria:** Shop keepers should be able to assign manufacturers to stock items.


###### View inventory

_As a shop keeper_<br />
_I want to be able to view all of my stock at once_<br />
_So that I can see at a glance what stock I currently have in store_<br />

**Acceptance Criteria:** Shop keepers should be able to view all of their stock on a single page.

_As a shop keeper_<br />
_I want to be be able to check stock levels_<br />
_So that I can be aware of low, medium and high stock levels for particular items_<br />

**Acceptance Criteria:** Shop keepers should be able to view stock levels in a coded manner i.e colour (red/orange/green) or "Low"/"Medium"/"High".


##### Possible Extensions (Create your own user stories for these)

* Calculate the markup on items in the store, and display it in the inventory
* Filter the inventory list by manufacturer. For example, provide an option to view all books in stock by a certain author.
* Categorise your items. Books might be categorised by genre (crime, horror, romance...) and cars might be categorised by type (SUV, coupé, hatchback...). Provide an option to filter the inventory list by these categories.
