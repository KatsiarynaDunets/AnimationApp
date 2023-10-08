//
//  AnimationVC.swift
//  AnimationApp
//
//  Created by Kate on 04/10/2023.
//

import UIKit
import Lottie
final class AnimationVC: UIViewController {

    @IBOutlet weak var coreAnimationView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var coreAnimationBtn: UIButton!
    @IBOutlet weak var lottieBtn: UIButton!
    
        private var lottieAnimationView: LottieAnimationView!

        override func viewDidLoad() {
            super.viewDidLoad()
            lottieAnimationViewSetup()
        }

        @IBAction func coreAnimationAction(_ sender: UIButton) {

            // анимация кнопки
            sender.pulsate()

            // продолжительность / задержка / опции анимации
            // Запустите анимацию назад и вперед (необходимо комбинировать с опцией повтора).

            UIView.animate(withDuration: 3,
                           delay: 0,
                           options: [.autoreverse, .repeat]) {
                self.coreAnimationView.frame.origin.x += 10
            } completion: { complete in
                print(complete)
            }
        }

        @IBAction func lottieButtonAction() {

            lottieAnimationView.play { completed in
                print("End lottieAnimationView")
            }

        }

        private func lottieAnimationViewSetup() {
            lottieAnimationView = .init(name: "film")
            lottieAnimationView.backgroundColor = .white
            lottieAnimationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            lottieAnimationView.contentMode = .scaleAspectFit
            lottieAnimationView.loopMode = .loop
            lottieAnimationView.animationSpeed = 0.5
            stackView.addArrangedSubview(lottieAnimationView)
        }
    }

