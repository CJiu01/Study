//
//  DatePickerTest.swift
//  loginpractice
//
//  Created by 최지우 on 2023/02/03.
//

import UIKit

class DatePickerTest: UIViewController {

    private let startDatePicker = UIDatePicker()
    private let endDatePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        configureUI()
    }

    // MARK: - UI
    private func configureUI() {
        setAttributes()
        setContraints()
    }

    private func setAttributes() {
        startDatePicker.preferredDatePickerStyle = .compact
        startDatePicker.datePickerMode = .dateAndTime
        startDatePicker.locale = Locale(identifier: "ko-KR")
        startDatePicker.timeZone = .autoupdatingCurrent
        // 분 단위 설정이 30분 간격
        startDatePicker.minuteInterval = 30
        // 날짜 비활성화
        var components = DateComponents()
        components.day = 10
        let maxDate = Calendar.autoupdatingCurrent.date(byAdding: components, to: Date())
        components.day = -10
        let minDate = Calendar.autoupdatingCurrent.date(byAdding: components, to: Date())

        startDatePicker.maximumDate = maxDate
        startDatePicker.minimumDate = minDate


        startDatePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
    }

    private func setContraints() {
        view.addSubview(startDatePicker)
        startDatePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startDatePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            startDatePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            startDatePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    // MARK: - Selectors
    @objc
    private func handleDatePicker(_ sender: UIDatePicker) {
        print(sender.date)
    }
}
