let cheks = document.querySelectorAll('.del-d2');
let btnsend = document.querySelector('.btn-del2');





let arr = [];





const getFormValue = async(event) => {
    event.preventDefault();
    
    let cheks = document.querySelectorAll('.del-d2');

    for(let el of cheks)
    {
        if(el.checked){arr.push(el.getAttribute('data-row'))}
    }

    //let arrforSend = new Set(arr);
    let  arrforSend  = Array.from(new Set(arr));
    console.log(arrforSend)
      const data = {
          books: arrforSend
      };
    
  
  const jsonData = JSON.stringify(data);
  response = await fetch("book-del.php",{
    method:"POST",
    headers:{
        'Content-Type':'application/json',
    },
    body: jsonData
});
if(response.ok){
    const res = await response.text();
    alert('Данные на удаление отправлены');
    //console.log(res.title);
}
else{console.log(response.text)}
  console.log(data)
};

btnsend.onclick = getFormValue;


