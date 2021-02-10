//
//  ScanViewController.swift
//  IkhokhaStore
//
//  Created by Gontse Ranoto on 2021/02/07.
//

import UIKit
import BarcodeScanner
import Firebase
import CodableFirebase

@objc(ScanViewController)
final class ScanViewController: UIViewController {
    
    // MARK: - Properties
    
    // In a production app would consider using a container
    private lazy var coordinator: IMainCoordinator = MainCoordinator()

    private let viewModel = ScanViewModel()
    private  var scannerViewController = BarcodeScannerViewController()
    var ref: DatabaseReference!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - private methods
    
    private func setup() {
        title = screenTitle
        definesPresentationContext = true
        configureScanner()
        navigationController?.pushViewController(scannerViewController, animated: false)
        viewModelBinding()
        
    }
    
    private func viewModelBinding() {
        viewModel.success = { [weak self] (productItem) in
            let itemDetailViewController = ItemDetailsTableViewController.instantiate()
            itemDetailViewController.productItem = productItem
            self?.navigationController?.present(itemDetailViewController, animated: true, completion: nil)
            self?.scannerViewController.reset()
        }
        
        viewModel.failure = { error in
            print(error)
            // TODO: - Show Error
        }
    }
    
    private func configureScanner() {
        scannerViewController.codeDelegate = self
        scannerViewController.errorDelegate = self
        scannerViewController.dismissalDelegate = self
    }
    
    @IBAction func didTapScanAgain(_ sender: Any) {
        navigationController?.pushViewController(scannerViewController, animated: true)
    }
}

extension ScanViewController: BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
         viewModel.getScannedItem(code)
    }
    
    func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
       controller.dismiss(animated: true, completion: nil)
     }
    
    func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
       print(error)
     }
    
}

// MARK: - Strings

extension ScanViewController {
    var screenTitle: String { localizedString(forKey: "ScannerScreenTitle") }
}
