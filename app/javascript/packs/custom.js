$(document).ready(function (){
    let autoCompleteInput = $("input[data-behavior='autocomplete']");
    autoCompleteBookTitle(autoCompleteInput)

    $('a[data-toggle="tab"]').on('click', function (e) {
        let target = this.href.split('#');
        $('.nav a').filter('a[href="#'+target[1]+'"]').tab('show');
    });

    $('.toastBtn').on('click', function (e) {
        $(this).closest('.toast').toast('hide');
    });


});

function autoCompleteBookTitle(input){
    // autoCompleteInput.on('load change paste keyup', function () {
        var fieldValue = input;
        var options = {
            url: function(phrase) {
                return "/books/search.json?q=" + phrase;
            },
            getValue: function(element) {
                return element.title;
            },
            ajaxSettings: {
                dataType: "json",
                method: "GET",
                data: {
                    dataType: "json"
                }
            },
            preparePostData: function (data) {
                data.phrase = $("input#name").val();
                return data;
            },
            requestDelay: 900,
            list: {
                match: {
                    enabled: true
                },
                onSelectItemEvent: function () {
                    var selectedItem = input.getSelectedItemData();
                    $("input#book_id").val(selectedItem.id);
                    fieldValue.val(selectedItem.title);
                },
            },
            theme: "plate-dark",
        };
        $("[data-behavior='autocomplete']").easyAutocomplete(options);
    // });
};
