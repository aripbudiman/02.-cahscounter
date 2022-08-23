const express = require('express');
const expressLayouts = require('express-ejs-layouts');
const bodyParser = require('body-parser');
const {koneksi} = require('./utils/mysql');
const {hitung_jumlah} = require('./utils/create_tabel');
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.set('view engine', 'ejs');
app.use(expressLayouts);
app.use(express.static('public'));

app.get('/', function (req, res) {
    koneksi.query(`SELECT * FROM transaksi`, (err, results) =>{
        const data = {
            title:'Halaman Home',
            layout:'layouts/main',
            transaksion:results,
            hitung_jumlah
        }
        res.render('index.ejs', data)
    })
});

app.get('/dataJabatan', (req, res) => {
    let sql = "SELECT * FROM data_jabatan";
    let query = koneksi.query(sql, (err, results) => {
        if(err) throw err;
        const data = {
            title: "Halaman Data Jabatan",
            layout:"layouts/main",
            results
        }
        res.render('data_jabatan.ejs', data)
    });
});


app.post('/save',(req, res) => {
    let data = {nama_jabatan :req.body.nama_jabatan}
    let sql = "INSERT INTO data_jabatan SET ?";
    let query = koneksi.query(sql, data, (err, results) => {
        if(err) throw err;
        res.redirect('/dataJabatan')
    });
    });

app.get('/dataJabatan/:id', (req, res) => {
    let sql = `DELETE FROM data_jabatan WHERE id = ${req.params.id}`;
    let query = koneksi.query(sql, (err, results) => {
        if(err) throw err;
        console.log('berhasil')
        res.redirect('/dataJabatan');
    });
});


app.get('/data_karyawan', (req, res) => {
    let sql = `SELECT * FROM data_jabatan`;
    koneksi.query(sql, (err, result) => {
        koneksi.query(`SELECT * FROM data_karyawan`, (err, results) => {
            const data = {
                title:"Halaman Data Karyawan",
                layout:"layouts/main",
                jabatans:result,
                karyawans:results
            }
            res.render('data_karyawan.ejs', data);
        })
    });
});

app.post('/save_karyawan', (req, res) => {
    let sql = "INSERT INTO data_karyawan SET ?";
    let query = {nama_karyawan:req.body.nama_karyawan, jabatan_karyawan:req.body.jabatan_karyawan}
    koneksi.query(sql, query, (err, results) => {
        if(err) throw err;
        res.redirect('/data_karyawan')
        console.log("berhasil");
    });
});

app.get('/delete_karyawan/:id', (req, res) => {
    koneksi.query(`DELETE FROM data_karyawan WHERE id_karyawan=${req.params.id}`, (err, results) => {
        if(err) throw err;
        console.log('Data berhasil di delete')
        res.redirect('/data_karyawan');
    });
});


app.get('/transaksi', (req, res) => {
    koneksi.query(`SELECT * FROM data_karyawan`, (err, results) => {
        const data = {
            title:'Halaman Transaksi',
            layout:'layouts/main',
            karyawans:results
        }
        res.render('transaksi.ejs',data);
    })
});


app.post('/update_data_jabatan', (req, res) => {
    koneksi.query(`UPDATE data_jabatan SET nama_jabatan='${req.body.nama_jabatan}' WHERE id=${req.body.id_jabatan}`, (err, results) => {
        console.log('update berhasil');
        res.redirect('/dataJabatan');
    });
});


app.post('/save_transaksi', (req, res) => {
    let data = {
        petugas_transaksi:req.body.petugas_transaksi,
        seratus_ribu:req.body.seratus_ribu,
        tujuh_lima:req.body.tujuh_lima,
        lima_puluh:req.body.lima_puluh,
        dua_puluh:req.body.dua_puluh,
        sepuluh_ribu:req.body.sepuluh_ribu,
        lima_ribu:req.body.lima_ribu,
        dua_ribu:req.body.dua_ribu,
        seribu:req.body.seribu,
        seribu_coin:req.body.seribu_coin,
        lima_ratus_coin:req.body.lima_ratus_coin,
        dua_ratus_coin:req.body.dua_ratus_coin,
        seratus_coin:req.body.seratus_coin
    }
    koneksi.query(`INSERT INTO transaksi SET?`, data, (err, results) => {
        if(err) throw err;
        console.log('Data berhasil diinput');
        res.redirect('/');
    });
});

app.post('/update_karyawan', (req, res) => {
    let sql = `UPDATE data_karyawan SET nama_karyawan = '${req.body.nama_karyawan}', 
    jabatan_karyawan = '${req.body.jabatan_karyawan}'
    WHERE id_karyawan=${req.body.id_karyawan}`;
    koneksi.query(sql, (err, results) => {
        console.log('data berhasil di update');
        res.redirect('/data_karyawan');
    })
});

app.use('/', (req, res) => {
    res.status = 404
    res.send('404')
});

app.listen(3000)