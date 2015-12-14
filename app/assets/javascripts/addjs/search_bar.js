var search_bar = document.getElementById("search-bar");
var select_box = document.getElementById("select-search");
select_box.onchange = function (ev) {
  search_bar.setAttribute("action",ev.target.value);
}