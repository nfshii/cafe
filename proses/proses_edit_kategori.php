<?php
    include "connect.php";
    $id = (isset($_POST['id'])) ? htmlentities($_POST['id']) : "";
    $jenismenu = (isset($_POST['jenismenu'])) ? (htmlentities($_POST['jenismenu'])) : "";
    $kategori = (isset($_POST['kategori'])) ? htmlentities($_POST['kategori']) : "";
    


    if (!empty($_POST['input_kategori_validate'])) {
        $select = mysqli_query($conn, "SELECT kategori_menu FROM tb_kategori WHERE kategori_menu = '$kategori'");
        if (mysqli_num_rows($select) > 0) {
            $message = '<script>alert("kategori Menu yang dimasukkan telah ada");
                        window.location="../kategori"
                        </script>';
        } else {
            $query = mysqli_query($conn, "UPDATE tb_kategori SET jenis_menu='$jenismenu', kategori_menu='$kategori'WHERE id_menu='$id'");
            if ($query) {
                $message = '<script>alert("Data berhasil diupdate");
                            window.location="../kategori"
                            </script>';
            } else {
                $message = '<script>alert("Data gagal diupdate");
                window.location="../kategori"</script>';
            } 
        }
    } echo $message;
?>