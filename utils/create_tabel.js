const { koneksi } = require("./mysql");


// const seratus =["seratus_ribu", 
//                 "tujuh_lima", 
//                 "lima_puluh", 
//                 "dua_puluh", 
//                 "sepuluh_ribu", 
//                 "lima_ribu", 
//                 "dua_ribu", 
//                 "seribu", 
//                 "seribu_coin", 
//                 "lima_ratus_coin", 
//                 "dua_ratus_coin", 
//                 "seratus_coin"]


let hitungJumlah = ["SELECT SUM(seratus_ribu) FROM transaksi",
                        "SELECT SUM(tujuh_lima) FROM transaksi",
                        "SELECT SUM(lima_puluh) FROM transaksi",
                        "SELECT SUM(dua_puluh) FROM transaksi",]
                    
hitung_jumlah = hitungJumlah.forEach(hitung => {
    let query = koneksi.query(hitung, (err, results) => {
       if(err) throw err;
       return results;
    });
});

module.exports = {hitung_jumlah}