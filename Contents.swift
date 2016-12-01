//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport


class BaseView: UIView {
    override func didMoveToSuperview() {
        backgroundColor = .white
        super.didMoveToSuperview()
    }
}

class SampleTriangle: BaseView {
    override func draw(_ rect: CGRect) {
        let line = UIBezierPath()
        line.move(to: CGPoint(x: 100, y: 25))
        line.addLine(to: CGPoint(x: 175, y: 175))
        line.addLine(to: CGPoint(x: 25, y: 175))

        line.close()
        UIColor.red.setStroke()
        line.lineWidth = 3
        line.stroke()
    }
}

class SampleCircle: BaseView {
    override func draw(_ rect: CGRect) {
        let oval = UIBezierPath(ovalIn: CGRect(x: 5, y: 5, width: 50, height: 50))
        UIColor.blue.setStroke()
        oval.lineWidth = 2
        oval.stroke()
    }
}

class SampleRectangle: BaseView {
    override func draw(_ rect: CGRect) {
        let rect = UIBezierPath(rect: CGRect(x: 5, y: 5, width: 50, height: 30))
        UIColor.green.setFill()
        rect.fill()
    }
}

class SampleRoundedRectangle: BaseView {
    override func draw(_ rect: CGRect) {
        let rrect = UIBezierPath(roundedRect: CGRect(x: 5, y: 5, width: 50, height: 30), cornerRadius: 5.0)
        UIColor.magenta.setStroke()
        rrect.lineWidth = 2
        rrect.stroke()
    }
}

class SampleRoundedRectangle2: BaseView {
    override func draw(_ rect: CGRect) {
        let rrect = UIBezierPath(roundedRect: CGRect(x: 5, y: 5, width: 50, height: 30), byRoundingCorners: .bottomLeft, cornerRadii: CGSize(width: 10, height: 10))
        UIColor.magenta.setStroke()
        rrect.lineWidth = 2
        rrect.stroke()
    }
}

class SampleCircle2: BaseView {
    override func draw(_ rect: CGRect) {
        let oval = UIBezierPath(arcCenter: CGPoint(x: 30, y: 30), radius: 25, startAngle: 0.0, endAngle: CGFloat(M_PI * (8/5)) , clockwise: true)
        UIColor.brown.setStroke()
        oval.lineWidth = 2
        oval.stroke()
    }
}

class SampleRotatedRectangle: BaseView {
    override func draw(_ rect: CGRect) {
        var transform = CGAffineTransform(rotationAngle: CGFloat(-10 * (M_PI/180)))
        let cgPath = CGPath(rect: CGRect(x: 25, y: 25, width: 50, height: 30), transform: &transform)
        let bpath = UIBezierPath(cgPath: cgPath)
        UIColor.orange.setStroke()
        bpath.lineWidth = 3
        bpath.stroke()
    }
}


let view = UIView()
view.backgroundColor = .white
view.frame = CGRect(x: 0, y: 0, width: 360, height: 480)

let triangle = SampleTriangle(frame: CGRect(x: 30, y: 30, width: 200, height: 200))
view.addSubview(triangle)

let oval = SampleCircle(frame: CGRect(x: 30, y: 250, width: 60, height: 60))
view.addSubview(oval)

let rect = SampleRectangle(frame: CGRect(x: 100, y: 250, width: 60, height: 60))
view.addSubview(rect)

let rrect = SampleRoundedRectangle(frame: CGRect(x: 160, y: 250, width: 60, height: 60))
view.addSubview(rrect)

let rrect2 = SampleRoundedRectangle2(frame: CGRect(x: 220, y: 250, width: 60, height: 60))
view.addSubview(rrect2)

let oval2 = SampleCircle2(frame: CGRect(x: 30, y: 320, width: 60, height: 60))
view.addSubview(oval2)

let rotatedRect = SampleRotatedRectangle(frame: CGRect(x: 100, y: 320, width: 100, height: 60))
view.addSubview(rotatedRect)


PlaygroundPage.current.liveView = view

