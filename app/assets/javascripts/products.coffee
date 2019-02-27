# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  formatproduct = (product) ->
    if product.loading
      return 'Loading...'
    markup = '<div class=\'select2-result-product clearfix\'>'
    product.code

  formatproductSelection = (product) ->
    product.name

  window.select2_multisearch '.product-select2', '/products/get_products', formatproduct, formatproductSelection
  
