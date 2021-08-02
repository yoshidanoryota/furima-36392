function post (){
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = inputValue * 0.1;
  const salesProfit = document.getElementById("profit"); 
  salesProfit.innerHTML = inputValue - (inputValue * 0.1);
})
};
window.addEventListener('load', post);