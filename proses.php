<table border="1">
 <tr>
  <th>No</th>
  <th>ID Film</th>
  <th>Nama Film</th>
  <th>Tempat</th>
 </tr>

<?php  
 include 'koneksi.php';
 $no_urut = 0;
 $search = $_POST['search'];
 $query = "SELECT * FROM theater_jakarta WHERE nama_film LIKE '%$search%'";
 $result = mysql_query($query);
 while($data = mysql_fetch_array($result)) {
  $no_urut++;
  echo "<tr>
     <td>$no_urut</td>
     <td>".$data['id']."</td>
     <td>".$data['nama_film']."</td>
     <td>".$data['tempat']."</td>
  <tr>";
 }
?>
</table>