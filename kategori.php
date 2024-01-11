<?php
    include "proses/connect.php";
    $query = mysqli_query($conn, "SELECT * FROM tb_kategori");
    while ($record = mysqli_fetch_array($query)) {
        $result[] = $record;
    }
?>
<div class="col-lg-9 mt-2">
    <div class="card">
        <div class="card-header">
            Halaman Kategori Menu
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col d-flex justify-content-end">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalTambahUser">Tambah
                        kategori Menu
                    </button>
                </div>
            </div>
            <!-- Modal tambah kategori menu baru -->
            <div class="modal fade" id="ModalTambahUser" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-xl modal-fullscreen-md-down">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah kategori Menu</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="needs-validation" novalidate action="proses/proses_input_kategori.php"
                                method="POST">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-floating mb-3">
                                            <select class="form-select" name="jenismenu" id="">
                                                <option value="1">makanan</option>
                                                <option value="2">minuman</option>
                                            </select>
                                            <label for="floatingInput">Jenis menu</label>
                                            <div class="invalid-feedback">
                                                Masukkan Jenis menu
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" id="floatingInput" placeholder=""
                                                name="kategori" required>
                                            <label for="floatingInput">Kategori Menu</label>
                                            <div class="invalid-feedback">
                                                Masukkan Kategori Menu
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" name="input_kategori_validate"
                                        value="12345">Save changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal tambah kategori menu baru -->

            <?php
                foreach ($result as $row) {
            ?>

            <!-- Modal edit -->
            <div class="modal fade" id="ModalEdit<?php echo $row['id_menu'] ?>" tabindex="-1"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl modal-fullscreen-md-down">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Edit kategori Menu</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="needs-validation" novalidate action="proses/proses_edit_kategori.php"
                                method="POST">
                                <input type="hidden" value="<?php echo $row['id_menu'] ?>" name="id">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-floating mb-3">
                                            <select class="form-select" aria-label="Default select example" required
                                                name="jenismenu" id="">
                                                <?php
                                                $data = array("makanan", "minuman");
                                                foreach ($data as $key => $value) {
                                                    if ($row['jenis_menu'] == $key+1) {
                                                        echo "<option selected value=".($key+1).">$value</option>";
                                                    } else {
                                                        echo "<option value=".($key+1).">$value</option>";
                                                    }
                                                }
                                            ?>
                                            </select>
                                            <label for="floatingInput">Jenis menu</label>
                                            <div class="invalid-feedback">
                                                Masukkan Jenis menu
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" id="floatingInput" placeholder=""
                                                name="kategori" required value="<?php echo $row['kategori_menu'] ?>">
                                            <label for="floatingInput">Kategori Menu</label>
                                            <div class="invalid-feedback">
                                                Masukkan Kategori Menu
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" name="input_kategori_validate"
                                        value="12345">Save changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- end edit menu -->

            <!-- modal delete -->
            <div class="modal fade" id="ModalDelete<?php echo $row['id_menu'] ?>" tabindex="-1"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-md modal-fullscreen-md-down">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Delete Kategori Menu</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="needs-validation" novalidate action="proses/proses_delete_kategori.php"
                                method="POST">
                                <input type="hidden" value="<?php echo $row['id_menu'] ?>" name="id">
                                <div class="col-lg-12">
                                    apakah anda ingin menghapus kategori Menu
                                    <b><?php echo $row['kategori_menu'] ?></b>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-danger" name="hapus_kategori_validate"
                                        value="12345">Hapus</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End modal delete -->



            <?php
                }
                if (empty($result)) {
                    echo "Data user tidak ada";
                } else {
            ?>

            <!-- tabel daftar kategori menu -->
            <div class=" table-responsive mt-2">
                <table class="table table-hover" id="example">
                    <thead>
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Jenis Menu</th>
                            <th scope="col">Kategori Menu</th>
                            <th scope="col">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1;
                        foreach ($result as $row) {
                    ?>
                        <tr>
                            <th scope="row"><?php echo $no++ ?></th>
                            <td>
                                <?php echo ($row['jenis_menu']==1) ? "makanan": "minuman" ?>
                            </td>
                            <td>
                                <?php echo $row['kategori_menu'] ?>
                            </td>

                            <td class="d-flex">

                                <button class="btn btn-warning btn-sm me-1" data-bs-toggle="modal"
                                    data-bs-target="#ModalEdit<?php echo $row['id_menu'] ?>"><i
                                        class="bi bi-pencil-square"></i></button>
                                <button class="btn btn-danger btn-sm me-1" data-bs-toggle="modal"
                                    data-bs-target="#ModalDelete<?php echo $row['id_menu'] ?>"><i
                                        class="bi bi-trash"></i></button>

                            </td>
                        </tr>
                        <?php
                        }
                    ?>
                    </tbody>
                </table>
            </div>
            <!-- end tabel kat menu -->

            <?php
                }
            ?>
        </div>
    </div>
</div>