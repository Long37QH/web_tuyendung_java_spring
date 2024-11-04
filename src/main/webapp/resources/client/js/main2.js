(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner(0);


    // Fixed Navbar
    $(window).scroll(function () {
        if ($(window).width() < 992) {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow');
            } else {
                $('.fixed-top').removeClass('shadow');
            }
        } else {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow').css('top', 0);
            } else {
                $('.fixed-top').removeClass('shadow').css('top', 0);
            }
        }
    });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
        return false;
    });


    // Testimonial carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 2000,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 1
            },
            992: {
                items: 2
            },
            1200: {
                items: 2
            }
        }
    });


    // vegetable carousel
    $(".vegetable-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav: true,
        navText: [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            },
            1200: {
                items: 4
            }
        }
    });


    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $('#videoModal').on('shown.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        })

        $('#videoModal').on('hide.bs.modal', function (e) {
            $("#video").attr('src', $videoSrc);
        })

        //add active class to header
        const navElement = $("#navbarCollapse");
        const currentUrl = window.location.pathname;
        navElement.find('a.nav-link').each(function () {
            const link = $(this); // Get the current link in the loop
            const href = link.attr('href'); // Get the href attribute of the link

            if (href === currentUrl) {
                link.addClass('active'); // Add 'active' class if the href matches the current URL
            } else {
                link.removeClass('active'); // Remove 'active' class if the href does not match
            }
        });
    });



    // Product Quantity
    // $('.quantity button').on('click', function () {
    //     var button = $(this);
    //     var oldValue = button.parent().parent().find('input').val();
    //     if (button.hasClass('btn-plus')) {
    //         var newVal = parseFloat(oldValue) + 1;
    //     } else {
    //         if (oldValue > 0) {
    //             var newVal = parseFloat(oldValue) - 1;
    //         } else {
    //             newVal = 0;
    //         }
    //     }
    //     button.parent().parent().find('input').val(newVal);
    // });
    $('.quantity button').on('click', function () {
        let change = 0;

        var button = $(this);
        var oldValue = button.parent().parent().find('input').val();
        if (button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
            change = 1;
        } else {
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
                change = -1;
            } else {
                newVal = 1;
            }
        }
        const input = button.parent().parent().find('input');
        input.val(newVal);

        //set form index
        const index = input.attr("data-cart-detail-index")
        const el = document.getElementById(`cartDetails${index}.quantity`);
        $(el).val(newVal);



        //get price
        const price = input.attr("data-cart-detail-price");
        const id = input.attr("data-cart-detail-id");

        const priceElement = $(`p[data-cart-detail-id='${id}']`);
        if (priceElement) {
            const newPrice = +price * newVal;
            priceElement.text(formatCurrency(newPrice.toFixed(2)) + " đ");
        }

        //update total cart price
        const totalPriceElement = $(`p[data-cart-total-price]`);

        if (totalPriceElement && totalPriceElement.length) {
            const currentTotal = totalPriceElement.first().attr("data-cart-total-price");
            let newTotal = +currentTotal;
            if (change === 0) {
                newTotal = +currentTotal;
            } else {
                newTotal = change * (+price) + (+currentTotal);
            }

            //reset change
            change = 0;

            //update
            totalPriceElement?.each(function (index, element) {
                //update text
                $(totalPriceElement[index]).text(formatCurrency(newTotal.toFixed(2)) + " đ");

                //update data-attribute
                $(totalPriceElement[index]).attr("data-cart-total-price", newTotal);
            });
        }
    });

    function formatCurrency(value) {
        // Use the 'vi-VN' locale to format the number according to Vietnamese currency format
        // and 'VND' as the currency type for Vietnamese đồng
        const formatter = new Intl.NumberFormat('vi-VN', {
            style: 'decimal',
            minimumFractionDigits: 0, // No decimal part for whole numbers
        });

        let formatted = formatter.format(value);
        // Replace dots with commas for thousands separator
        formatted = formatted.replace(/\./g, ',');
        return formatted;
    }

    //handle filter products
    $('#btnFilter').click(function (event) {
        event.preventDefault();

        let inductryArr = [];
        let areaArr = [];
        let workingFormArr = [];
        let experienceArr = [];
        let salaryFormArr = [];
        //inductry filter
        $("#inductryFilter .form-check-input:checked").each(function () {
            inductryArr.push($(this).val());
        });

        //areaFilter
        $("#areaFilter .form-check-input:checked").each(function () {
            areaArr.push($(this).val());
        });

        //workingFormFilter
        $("#workingFormFilter .form-check-input:checked").each(function () {
            workingFormArr.push($(this).val());
        });

        //experienceFilter
        $("#experienceFilter .form-check-input:checked").each(function () {
            experienceArr.push($(this).val());
        });

        //salaryFilter
        $("#salaryFilter .form-check-input:checked").each(function () {
            salaryFormArr.push($(this).val());
        });

        //sort order
        // let sortValue = $('input[name="radio-sort"]:checked').val();

        const currentUrl = new URL(window.location.href);
        const searchParams = currentUrl.searchParams;

        // Add or update query parameters
        searchParams.set('page', '1');
        // searchParams.set('sort', sortValue);

        //reset
        //reset
        searchParams.delete('inductry');
        searchParams.delete('area');
        searchParams.delete('workingForm');
        searchParams.delete('salary');
        searchParams.delete('experience');

        if (inductryArr.length > 0) {
            searchParams.set('inductry', inductryArr.join(','));
        }
        if (areaArr.length > 0) {
            searchParams.set('area', areaArr.join(','));
        }
        if (workingFormArr.length > 0) {
            searchParams.set('workingForm', workingFormArr.join(','));
        }
        if (experienceArr.length > 0) {
            searchParams.set('experience', experienceArr.join(','));
        }
        if (salaryFormArr.length > 0) {
            searchParams.set('salary', salaryFormArr.join(','));
        }
       
        // Update the URL and reload the page
        window.location.href = currentUrl.toString();
    });

    //handle auto checkbox after page loading
    // Parse the URL parameters
    const params = new URLSearchParams(window.location.search);

    // Set checkboxes for 'inductry'
    if (params.has('inductry')) {
        const factories = params.get('inductry').split(',');
        factories.forEach(inductry => {
            $(`#inductryFilter .form-check-input[value="${inductry}"]`).prop('checked', true);
        });
    }

    // Set checkboxes for 'area'
    if (params.has('area')) {
        const targets = params.get('area').split(',');
        targets.forEach(area => {
            $(`#areaFilter .form-check-input[value="${area}"]`).prop('checked', true);
        });
    }

    // Set checkboxes for 'workingForm'
    if (params.has('workingForm')) {
        const prices = params.get('workingForm').split(',');
        prices.forEach(workingForm => {
            $(`#workingFormFilter .form-check-input[value="${workingForm}"]`).prop('checked', true);
        });
    }

    // Set checkboxes for 'salary'
    if (params.has('salary')) {
        const prices = params.get('salary').split(',');
        prices.forEach(salary => {
            $(`#salaryFilter .form-check-input[value="${salary}"]`).prop('checked', true);
        });
    }

    // Set checkboxes for 'experience'
    if (params.has('experience')) {
        const prices = params.get('experience').split(',');
        prices.forEach(experience => {
            $(`#experienceFilter .form-check-input[value="${experience}"]`).prop('checked', true);
        });
    }
    


})(jQuery);

