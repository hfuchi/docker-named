$TTL 86400 ; 24 hours could have been written as 24h or 1d
; $TTL used for all RRs without explicit TTL value
$ORIGIN example.com.
@  1D  IN  SOA ns1.example.com. hostmaster.example.com. (
         2002022401 ; serial
         3H ; refresh
         15 ; retry
         1w ; expire
         3h ; nxdomain ttl
        )
       IN  NS     ns.example.com. 
       IN  NS     ns.test.com. 
       IN  MX     10 mail.example.com.
       IN  MX     20 ns.example.com. 
ns     IN  A      192.168.1.226 
www    IN  A      192.168.1.80  
ftp    IN  CNAME  www.example.com. 
nfs    IN  A      192.168.1.230
mail   IN  A      192.168.1.25

