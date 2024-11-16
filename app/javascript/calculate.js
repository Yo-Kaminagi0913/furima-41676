
function calculate () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    function formatNumberWithCommas(number) {
      return number.toLocaleString();
    }
    const amount = itemPrice.value;
    const fee = Math.floor(amount * 0.1);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.textContent = formatNumberWithCommas(fee);
    const remaining = Math.floor(amount - fee);
    const profit = document.getElementById("profit");
    profit.textContent = formatNumberWithCommas(remaining);
  });
};

window.addEventListener('turbo:load', calculate);