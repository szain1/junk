const base_url="https://api.exchangerate-api.com/v4/latest/";
const dropdown=document.querySelectorAll(".dropdown-item");
for(code in countrylist){
    console.log(code, countrylist[code]);
    let option=document.createElement("option");
    option.value=code;
    option.innerHTML=countrylist[code].name;
    option.setAttribute("data-flag", countrylist[code].flag);   
    option.setAttribute("data-code", code);
    option.setAttribute("data-currency", countrylist[code].currency);
    option.setAttribute("data-currency-symbol", countrylist[code].currency_symbol);
}
