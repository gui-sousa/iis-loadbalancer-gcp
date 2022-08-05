$node1 = "bookshelf-sql1"
$node2 = "bookshelf-sql2"

$nameWSFC = "bookshelf-dbclus"

$ipWSFC1 = "10.3.0.4"
$ipWSFC2 = "10.4.0.4"
$ipWSListener1 = "10.3.0.5"
$ipWSListener2 = "10.4.0.5"


$SQLServer1IsReady=$False
For ($i=0; $i -le 30; $i++) {
    $SqlCatalog = "master"
    $SqlConnection = New-Object System.Data.SqlClient.SqlConnection
    $SqlConnection.ConnectionString = "Server = $node1;" + `
         "Database = $SqlCatalog; Integrated Security = True"
    try {
        $SqlConnection.Open()
        Write-Host "Connection to the server $node1 was successful"
        $SQLServer1IsReady=$True
        $SqlConnection.Close()
        break
    }
    catch {
        Write-Host "SQL server $node1 is not ready, waiting for 60s"
        Start-Sleep -s 60 #Wait for 60 seconds
    }
}
if($SQLServer1IsReady -eq $False) {
    Write-Error "$node1 is not responding. Was it deployed correctly?"
}