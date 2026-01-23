
/*
 * Table
 */
table.dataTable {

}


table.dataTable thead th {
cursor: pointer;
	
*cursor: hand;
}


table.dataTable tfoot th {
	
}



table.dataTable td {
	
}


table.dataTable td.center,
table.dataTable td.dataTables_empty {

}


table.dataTable tr.odd { 

}

table.dataTable tr.even { 

}


table.dataTable tr.odd td.sorting_1 { 

}
table.dataTable tr.odd td.sorting_2 { 

}

table.dataTable tr.odd td.sorting_3 { 

}

table.dataTable tr.even td.sorting_1 { 
}

table.dataTable tr.even td.sorting_2 { 

}

table.dataTable tr.even td.sorting_3 { 

}



/*
 * Table wrapper
 */
.dataTables_wrapper {
	
position: relative;
	
clear: both;
	
*zoom: 1;

}



/*
 * Page length menu
 */
.dataTables_length {
	
float: right;

}



/*
 * Filter
 */
.dataTables_filter {
	
float: left;
	
text-align: left;

}



/*
 * Table information
 */
.dataTables_info {
	
clear: both;
	
float: left;

}



/*
 * Pagination
 */
.dataTables_paginate {
	
float: left;
	
text-align: left;

}
/* Two button pagination - previous / next */
.paginate_disabled_previous,
.paginate_enabled_previous,
.paginate_disabled_next,
.paginate_enabled_next {
height: 19px;
	
float: left;
	
cursor: pointer;
	
*cursor: hand;
	
color: #333 !important;

}

.paginate_disabled_previous:hover,
.paginate_enabled_previous:hover,
.paginate_disabled_next:hover,
.paginate_enabled_next:hover {
	
text-decoration: none !important;

}

.paginate_disabled_previous:active,
.paginate_enabled_previous:active,
.paginate_disabled_next:active,
.paginate_enabled_next:active {
	
outline: none;

}


.paginate_disabled_previous,
.paginate_disabled_next {
	
color: #333 !important;

}

.paginate_disabled_previous,
.paginate_enabled_previous {
	
}

.paginate_disabled_next,
.paginate_enabled_next {
	
}


.paginate_enabled_previous { 
background: url('../images/back_enabled.png') no-repeat bottom left; 
}

.paginate_enabled_previous:hover { 
background: url('../images/back_enabled_hover.png') no-repeat top left; 
}

.paginate_disabled_previous { 
background: url('../images/back_disabled.png') no-repeat top left; 
}


.paginate_enabled_next { 
background: url('../images/forward_enabled.png') no-repeat bottom right; 
}

.paginate_enabled_next:hover { 
background: url('../images/forward_enabled_hover.png') no-repeat top right; 
}

.paginate_disabled_next { 
background: url('../images/forward_disabled.png') no-repeat top right; 
}


/* Full number pagination */
.paging_full_numbers {
	
height: 22px;
	
line-height: 22px;

}

.paging_full_numbers a:active {
	
outline: none

}

.paging_full_numbers a:hover {
	
text-decoration: none;

}


.paging_full_numbers a.paginate_button,
.paging_full_numbers a.paginate_active {

border: 1px solid #aaa;
	
-webkit-border-radius: 5px;
	
-moz-border-radius: 5px;
	
border-radius: 5px;
	
padding: 2px 5px;
	
margin: 0 3px;
	
cursor: pointer;
	
*cursor: hand;
	
color: #333 !important;

}


.paging_full_numbers a.paginate_button {
	
background-color: white;
}


.paging_full_numbers a.paginate_button:hover {
	
background-color: white;
	
text-decoration: none !important;

}


.paging_full_numbers a.paginate_active {
	
background-color: white;

}



/*
 * Processing indicator
 */
.dataTables_processing {
	
position: absolute;
	
top: 70%;
	
left: 70%;
	
width: 2500px;
	
height: 30px;
	
margin-left: -125px;
	
margin-top: -15px;
	
padding: 14px 0 2px 0;
	
border: 1px solid #ddd;
	
text-align: center;
	
color: #111;
	
font-size: 14px;
	

}



table.dataTable thead th:active,
table.dataTable thead td:active {
	
outline: none;

}



/*
 * Scrolling
 */
.dataTables_scroll {
	
clear: both;

}


.dataTables_scrollBody {
	
*margin-top: -1px;
	
-webkit-overflow-scrolling: touch;

}