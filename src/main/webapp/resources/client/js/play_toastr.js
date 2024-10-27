$(document).ready(function () {
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": true,
        "progressBar": true,
        "positionClass": "toast-custom-top-right", // Thay đổi vị trí hiển thị
        "preventDuplicates": true,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "3000", // Thời gian tồn tại của thông báo
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    // Check if there's a flash attribute 'message'
    <c:if test="${not empty message}">
        toastr.success("${message}");
    </c:if>
});