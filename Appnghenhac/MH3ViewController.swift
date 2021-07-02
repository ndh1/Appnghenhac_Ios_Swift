//
//  MH3ViewController.swift
//  Appnghenhac
//
//  Created by Nguyen Dinh Huong on 10/29/20.
//

import UIKit
import AVFoundation
import QuartzCore

var bh:BaiHat! = nil
var player : AVAudioPlayer!
var vitriBH: Int = -1


class MH3ViewController: UIViewController {

    @IBOutlet weak var lblTenBH: UILabel!
    @IBOutlet weak var imgDisc: UIImageView!
    
    @IBOutlet weak var btnPhat: UIButton!
    @IBOutlet weak var imgHinhNen: UIImageView!
    @IBOutlet weak var lblThoiGianBD: UILabel!
    @IBOutlet weak var lblThoiGianKT: UILabel!
    @IBOutlet weak var sldThoiGianBaiHat: UISlider!
    
    var timer:Timer!
    var goc:Int = 0
    var dangPhat :Bool = false

    
    let image1 = UIImage(named: "play-2")
    let image2 = UIImage(named: "Pause")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if bh.dangPhat == false
        {
            chonbaihat(baihat: bh)
            bh.dangPhat = true
        }
        else
        {
            KhoiTao(baihat: bh)
            KhoiTaoSlider(giatri: Float(player.duration))
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        imgDisc.clipsToBounds = true
        imgDisc.layer.cornerRadius = imgDisc.frame.width/2
        btnPhatNhac(btnPhat)
    }

    @IBAction func btnPhatNhac(_ sender: Any) {
            
        if let btn = sender as? UIButton
        {
            
            if dangPhat
            {
                player.pause()
                btn.setImage(image1, for: .normal)
                timer.invalidate()
                timer = nil
            }
            else
            {
                player.play()
                if timer == nil
                {
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MH3ViewController.xoaydia), userInfo: nil, repeats: true)
                }
                btn.setImage(image2, for: .normal)
            }
            dangPhat = !dangPhat
        }
            
                
            }
    @IBAction func btnNext(_ sender: Any) {
        vitriBH += 1
        if vitriBH > arrBH.count - 1
        {
            vitriBH = 0
        }
        chonbaihat(baihat: arrBH[vitriBH])
        dangPhat = false
        btnPhatNhac(btnPhat)
        bh = arrBH[vitriBH]
        bh.dangPhat = true
    }
    @IBAction func btnBack(_ sender: Any) {
        vitriBH -= 1
        if vitriBH > arrBH.count - 1
        {
            vitriBH = 0
        }
        chonbaihat(baihat: arrBH[vitriBH])
        dangPhat = false
        btnPhatNhac(btnPhat)
        bh = arrBH[vitriBH]
        bh.dangPhat = true
    }
    @IBAction func btnLapLai(_ sender: Any) {
    }
    @IBAction func btnNgauNhien(_ sender: Any) {
    }
    
    @IBAction func sldThoiGianBaiHat(_ sender: Any) {
        
        player.currentTime = TimeInterval(sldThoiGianBaiHat.value)
        capNhatThoiGian()
    }
    
    @objc func xoaydia()
    {
        goc += 1
        if goc == 360{
            goc = 0
        }
        UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
            self.imgDisc.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI) * CGFloat(self.goc), 0, 0, 1)
        }, completion: nil)
        capNhatThoiGian()
        sldThoiGianBaiHat.value = Float(player.currentTime)
    }
    
    func capNhatThoiGian()
    {
        lblThoiGianBD.thoigianbaihat(thoigian: player.currentTime)
        lblThoiGianKT.thoigianbaihat(thoigian: player.duration - player.currentTime)
        
    }
    
    func chonbaihat(baihat:BaiHat){
        let url:URL = URL(fileURLWithPath: baihat.duongDan)
        do
        {
            player = try AVAudioPlayer(contentsOf: url)
            lblThoiGianKT.thoigianbaihat(thoigian: player.duration)
            KhoiTaoSlider(giatri: Float(player.duration))
        }
        catch
        {
            print("Loi lay nhac")
        }
        KhoiTao(baihat: baihat)
    }
    
    func KhoiTao(baihat:BaiHat){
        lblTenBH.text = baihat.tenBH
        imgDisc.image = baihat.hinhBH
        imgHinhNen.image = baihat.hinhBH
    }
    
    func KhoiTaoSlider(giatri:Float)
    {
        self.sldThoiGianBaiHat.maximumValue = giatri
        
    }
}




extension UILabel
{
    func thoigianbaihat(thoigian:TimeInterval)
    {
        let t:Int = Int(thoigian)
        let phut:Int = t / 60
        let giay:Int = t % 60
        var chuoiphut:String = ""
        var chuoigiay:String = ""
        if phut < 10
        {
            chuoiphut = "0\(phut)"
        }
        else
        {
            chuoiphut = "\(phut)"
        }
        
        if giay < 10
        {
            chuoigiay = "0\(giay)"
        }
        else
        {
            chuoigiay = "\(giay)"
        }
        
        self.text = "\(chuoiphut):\(chuoigiay)"
    }
}
