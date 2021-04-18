<table border="1">
 <tr>
  <th>Id Gudang</th>
  <th>Stok</th>
  <th>Tanggal Datang</th>
  <th>Jenis Produk</th>
  <th>Id Pesan</th>
  <th>Kode Produk</th>
 </tr>

<?php  
 include 'konek.php';
 $no_urut = 0;
 $search = $_POST['search'];
 $query = "SELECT * FROM gudang '%$search%'";
 $result = mysql_query($query);
 while($data = mysql_fetch_array($result)) {
  $no_urut++;
  echo "<tr>
     <td>$no_urut</td>
     <td>".$data['idgudang']."</td>
     <td>".$data['stok_produk']."</td>
     <td>".$data['tanggal_datang_bunga']."</td>
     <td>".$data['jenis_produk']."</td>
     <td>".$data['idpesan_bunga']."</td>
     <td>".$data['kode_produk']."</td>
     <tr>";
 }
?>
</table>
