<?php
    include "connect.php";
    $id = (isset($_POST['id'])) ? htmlentities($_POST['id']) : "";
    

    if (!empty($_POST['hapus_kategori_validate'])) {
        $select = mysqli_query($conn, "SELECT kategori FROM tb_daftar_menu WHERE kategori = '$id'");
        if (mysqli_num_rows($select) > 0) {
            $message = '<script>alert(" !! kategori telah digunakan & tidak dapat dihapus !!");
                        window.location="../kategori"
                        </script>';
        } else {
            $query = mysqli_query($conn, "DELETE FROM tb_kategori WHERE id_menu='$id'");
        if ($query) {
            
            $message = '<script>alert("Data berhasil dihapus");
                        window.location="../kategori" </script>';
                        
        } else {
            $message = '<script>alert("Data gagal dihapus");
                        window.location="../kategori" </script>';
        } 
    }
    } echo $message;
?>