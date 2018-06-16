//
//  Match.swift
//  karaoke_iOS
//
//  Created by y18aim on 2018/06/16.
//  Copyright © 2018年 CATK. All rights reserved.
//

import UIKit
import Charts


class Match: UIViewController {
    @IBOutlet weak var userName: UILabel!
    let chartview:PieChartView = PieChartView(frame: CGRect(x: 67, y: 200, width: 250, height: 250))
    var matchGraph:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chartview.highlightPerTapEnabled = false
        chartview.chartDescription?.enabled = false
        chartview.legend.enabled = false
        chartview.rotationEnabled = false
        
        //1つ目のvalueにマッチ度の値をいれる。二つ目は100から1つ目のvalueを引く
        let set = PieChartDataSet(values: [PieChartDataEntry(value: 80),PieChartDataEntry(value: 20)], label: "Election Results")
        set.setColors(UIColor(red: 1, green: 0.549, blue: 0.549, alpha: 1.0),UIColor.white)
        chartview.data = PieChartData(dataSet: set)
        self.view.addSubview(chartview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}
