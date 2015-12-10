const huko = document.createElement("h1");
huko.innerHTML = "親不孝four";
let header = document.getElementById("header");
let title = document.getElementById("title");
let copy = document.getElementById("copy");
var path = document.location.pathname;
huko.onclick = () => {
  document.location.pathname = "/dodai_inbu_osu_saiko_css"
}
console.log(path)


const oyaHuko = (header, text, location) => {
  return () => {
    if(location == "/about") {
      header.removeChild(header.children[0])
      header.appendChild(text);
    }
  }
}

const headerChange = oyaHuko(header, huko, path);
title.onmouseover = () => {
  copy.onclick = headerChange;
}
