document.addEventListener("turbolinks:load", function () {
  $("#item_price").on("keyup", function () {
    console.log("ok");
    let price = $(this).val();
    let fee = Math.round(price * 0.1);
    let profit = price - fee;
    $("#fee").text(fee);
    $("#profit").text(profit);
  });
});