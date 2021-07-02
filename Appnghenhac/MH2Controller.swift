//
//  MH2Controller.swift
//  Appnghenhac
//
//  Created by Nguyen Dinh Huong on 10/31/20.
//

import UIKit

let arrBH:Array<BaiHat> = [
    BaiHat(tenBH: "Hoạ Mây", duongDan: "/Users/nguyendinhhuong/Desktop/HoaMay.mp3", hinhBH: #imageLiteral(resourceName: "HoaMay")),
    BaiHat(tenBH: "Cung Đàn Vỡ Đôi", duongDan: "/Users/nguyendinhhuong/Desktop/CungDanVoDoi-ChiPu.mp3", hinhBH: #imageLiteral(resourceName: "CDVD")),
    BaiHat(tenBH: "Natural", duongDan: "/Users/nguyendinhhuong/Desktop/Natural - Imagine Dragons.mp3", hinhBH: #imageLiteral(resourceName: "logonhac")),
    BaiHat(tenBH: "Tình Yêu Khủng Long", duongDan: "/Users/nguyendinhhuong/Desktop/TinhYeuKhungLong.mp3", hinhBH: #imageLiteral(resourceName: "TYKL"))
]

class MH2Controller: UIViewController {

    @IBOutlet weak var tblDanhSachBH: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDanhSachBH.delegate = self
        tblDanhSachBH.dataSource = self
       
    }

}

extension MH2Controller:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBH.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellBH
        
        cell.lblTenBH.text = arrBH[indexPath.row].tenBH
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if bh != nil
        {
            if bh.tenBH != arrBH[indexPath.row].tenBH
            {
            bh = arrBH[indexPath.row]
            
            }
        }
        else
        {
            bh = arrBH[indexPath.row]
           
        }
        
        vitriBH = indexPath.row
        
        let scr = storyboard?.instantiateViewController(identifier: "MH3")
        navigationController?.pushViewController(scr!, animated: true)
    }
    
    
}
