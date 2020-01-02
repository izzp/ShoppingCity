var pic = 0;
var arr = new Array(5);
for (var i = 1; i < 5; i++) {
    arr[i] = i + ".png";
}
function checkpig() {
    pic = pic - 1;
    if (pic < 1) {
        pic = arr.length - 1;
    }
    document.getElementById("myimgg").src = "../images/" + arr[pic];
}
function checkpig1() {
    pic = pic + 1;
    if (pic > arr.length - 1) {
        pic = 1;
    }
    document.getElementById("myimgg").src = "../images/" + arr[pic];
}
setInterval("checkpig1()", 2000);