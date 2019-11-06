'use strict';
// Cache
var body = $('body');
var mainSlider = $('#main-slider');
var imageCarousel = $('.img-carousel');
var partnersCarousel = $('#partners');
var testimonialsCarousel = $('#testimonials');
var topProductsCarousel = $('#top-products-carousel');
var featuredProductsCarousel = $('#featured-products-carousel');
var sidebarProductsCarousel = $('#sidebar-products-carousel');
var hotDealsCarousel = $('#hot-deals-carousel');
var owlCarouselSelector = $('.owl-carousel');
var isotopeContainer = $('.isotope');
var isotopeFiltrable = $('#filtrable a');
var toTop = $('#to-top');
var hover = $('.thumbnail');
var navigation = $('.navigation');
var superfishMenu = $('ul.sf-menu');
var priceSliderRange = $('#slider-range');



jQuery(document).ready(function () {
    // Prevent empty links
    // ---------------------------------------------------------------------------------------
    $('a[href=#]').click(function (event) {
        event.preventDefault();
    });
    
    // Sliders
    // ---------------------------------------------------------------------------------------
    if ($().owlCarousel) {
        var owl = $('.owl-carousel');
        owl.on('changed.owl.carousel', function(e) {
            // update prettyPhoto
            if ($().prettyPhoto) {
                $("a[data-gal^='prettyPhoto']").prettyPhoto({
                    theme: 'dark_square'
                });
            }
        });
        // Main slider
        // Images carousel
        if (imageCarousel.length) {
            imageCarousel.owlCarousel({
                autoplay: false,
                loop: true,
                margin: 0,
                dots: true,
                nav: true,
                navText: [
                    "<i class='fa fa-angle-left'></i>",
                    "<i class='fa fa-angle-right'></i>"
                ],
                responsiveRefreshRate: 100,
                responsive: {
                    0: {items: 1},
                    479: {items: 1},
                    768: {items: 1},
                    991: {items: 1},
                    1024: {items: 1}
                }
            });
        }
    }
   
});