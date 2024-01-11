<?php
    include "connect.php";
    session_start();
    
    $id = (isset($_POST['id'])) ? htmlentities($_POST['id']) : "";
    $catatan = (isset($_POST['catatan'])) ? htmlentities($_POST['catatan']) : "";
    $jumlah = (isset($_POST['jumlah'])) ? htmlentities($_POST['jumlah']) : "";

    if (!empty($_POST['terima_orderitem_validate'])) {

            $query = mysqli_query($conn, "UPDATE tb_list_order SET catatan='$catatan', status=1 WHERE id_list_order='$id' ");
            if ($query) {
                $message = '<script>alert("berhasil terima Pesanan");
                            window.location="../dapur"</script>';
            } else {
                $message = '<script>alert("Gagal terima Pesanan");
                window.location="../dapur"</script>';
        } 
    } echo $message;
?>