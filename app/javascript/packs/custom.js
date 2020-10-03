$(document).ready(function (){
    $('a[data-toggle="tab"]').on('click', function (e) {
        let target = this.href.split('#');
        $('.nav a').filter('a[href="#'+target[1]+'"]').tab('show');
    });

    let autoCompleteInput = $("input[data-behavior='autocomplete']");
    autoCompleteInput.on('change paste keyup', function () {
        var fieldValue = $(this);
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
            list: {
                match: {
			        enabled: true
		        },
                onSelectItemEvent: function () {
                    debugger;
                    var selectedItem = autoCompleteInput.getSelectedItemData();
                    $("input#book_id").val(selectedItem.id);
                    fieldValue.val(selectedItem.title);
                },
            },
            theme: "plate-dark",
        };
        $("[data-behavior='autocomplete']").easyAutocomplete(options);
    });
});
