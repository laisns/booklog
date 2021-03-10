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

    $('.favorite-checkbox').on('click', function (e){
        toggleFavoriteIcon($(this))
    });

    $('.actions-toggle.dropdown-item').on('click', function (e){
        let attribute = $(this)[0];
        toggleAttributeValue(attribute);
    });

    $('#clickable-list').on('click', function (e){
        location.href = '/user_books'
    });
});

function autoCompleteBookTitle(input){
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
};

function toggleFavoriteIcon(element) {
    var checkbox = element.children('input[type=checkbox]')[0];
    var iconChecked = element.children('.icon-checked');
    var iconNonChecked = element.children('.icon-non-checked');
    if (checkbox.checked) {
        checkbox.checked = false;
        iconNonChecked.removeAttr('hidden');
        iconChecked.attr('hidden', 'hidden')
    } else {
        checkbox.checked = true;
        iconChecked.removeAttr('hidden');
        iconNonChecked.attr('hidden', 'hidden')
    }
};

function toggleAttributeValue(attrs) {
    $.ajax({
        type: 'GET',
        url: '/user_books/toggle_params',
        data: { attribute: attrs.dataset['attribute'],
                value: attrs.dataset['value'],
                list: attrs.dataset['list'],
                id: attrs.dataset['id'] },
        dataType: 'json',
        success: function(data){
            if (data['attribute'] == 'book_status') {
                $(attrs.parentElement).find('*').removeClass('select-attr');
            }
            attrs.classList.toggle('select-attr');
        }
    })
};