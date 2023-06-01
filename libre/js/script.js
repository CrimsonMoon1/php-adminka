
let inputName = document.querySelector('[name="name"]');

let rank = document.querySelector('[name="rank"]');



// function cheked(radio) {
//     $(radio).change(function() {
//         if ($(this).prop("checked")) {
//             pay = radio.value;
//         }
//     });
// }







const getFormValue = async(event) => {

    // $.ajax({
    //     url: '/validation.php',
    //     method: 'post',
    //     dataType: 'html',
    //     data: {
    //         inputName: inputName.value,
    //         inputLastName: inputLastName.value,
    //         phoneInput: phoneInput.value
    //     },
    //     success: function(data){
    //     alert(data);
    //     }
    // });

    const data = {
        inputName: inputName.value,
        rank: rank.value
        //price: price.value
    };
    const jsonData = JSON.stringify(data);
    response = await fetch("validation.php", {
        method: "POST",
        headers:{
            'Content-Type': 'application/json'
        },
        body: jsonData
    });
    if (response.ok) {
        //const res = await response.text();
        alert('Данные отправленны');
    };
    console.log(data);
};


// function validationText(input, error) {
//     $(input).blur(function() {
//                 if( input.value.match(/[0-9]/) )
//                 {
//                     error.innerHTML = "Поле может содержать латинские и русские буквы, дефис, пробел";
//                     $('.button').attr('disabled', 'true');
//                 }
//                 else{
//                     error.innerHTML = "";
//                     //$('.button').removeAttr('disabled');
//                 }
//       });
//   }

//   function validationRevers(input, error) {
//     $(input).blur(function() {
//                 if( input.value.match(/[а-я]/) )
//                 {
//                     error.innerHTML = "";
//                     error.innerHTML = "Поле может содержать цифры, дефис, пробел";
//                     $('.button').attr('disabled', 'true');
//                 }
//                 else{
//                     error.innerHTML = "";
//                     //$('.button').removeAttr('disabled');
//                 }
//       });
//   }


// $("document").ready(function(){
//     $("#feedBack").on("submit", function(){
//         let dataForm = $(this).serialize();
//         $.ajax({
//             url: '/validation.php',
//             method: 'post',
//             dataType: 'html',
//             data: {"text": "Текстовый"}, 
//             success: function(data){
//                 console.log(data);
//             }
//         })
//     });
// });
