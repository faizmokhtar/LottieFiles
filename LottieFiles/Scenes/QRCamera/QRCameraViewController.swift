//
//  QRCameraViewController.swift
//  LottieFiles
//
//  Created by AD0502-ADE-MB-1 on 18/03/2022.
//

import UIKit
import AVFoundation

enum DeviceError: Error {
    case videoCaptureUnavailable
}

extension DeviceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .videoCaptureUnavailable:
            return "Capture device for video is unavailable"
        }
    }
}

class QRCameraViewController: UIViewController {

    lazy var captureSessionInput: AVCaptureSession = {
        let session = AVCaptureSession()
        session.sessionPreset = .high
        return session
    }()
    
    lazy var captureSessionOutput: AVCapturePhotoOutput = {
        let session = AVCapturePhotoOutput()
        session.isHighResolutionCaptureEnabled = true
        return session
    }()
    
    lazy var videoPreviewLayer: AVCaptureVideoPreviewLayer = {
        let view = AVCaptureVideoPreviewLayer()
        view.videoGravity = .resizeAspectFill
        return view
    }()

    // MARK: - Inits

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        captureSessionInput.startRunning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        do {
            try setupVideoLayer()
        } catch (let error) {
            print(error.localizedDescription)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func setupVideoLayer() throws {
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            throw DeviceError.videoCaptureUnavailable
        }
        let input = try AVCaptureDeviceInput(device: captureDevice)
        captureSessionInput.addInput(input)
        captureSessionInput.addOutput(captureSessionOutput)
        
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSessionInput.addOutput(captureMetadataOutput)
        
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [.qr]
        
        videoPreviewLayer.session = captureSessionInput
        
        captureSessionInput.startRunning()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        videoPreviewLayer.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer)
    }
}

extension QRCameraViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        
        guard metadataObjects.count != 0,
                let metadataObject = metadataObjects[0] as? AVMetadataMachineReadableCodeObject,
                metadataObject.type == .qr,
                let qrStringValue = metadataObject.stringValue else {
                    return
                }
        
        captureSessionInput.stopRunning()
        let viewModel = QRDetailViewModel(urlString: qrStringValue)
        let viewController = QRDetailViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
