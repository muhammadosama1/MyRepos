//
//  chart.swift
//  Test
//
//  Created by Muhammad Osama on 22/09/2025.
//

import SwiftUI
import Charts

struct ActivityData: Identifiable {
    let id = UUID()
    let date: Date
    let activity: Double
}

struct UserActivityChart: View {
    @State private var activityData: [ActivityData] = []
    @State private var currentSelection: Date?
    @State private var isDragging: Bool = false
    @State private var cuttingPoint: CGFloat = 1.0
    @Environment(\.layoutDirection) private var layoutDirection

    var body: some View {
        Chart(activityData) { item in
            LineMark(
                x: .value("Date", item.date),
                y: .value("Activity", item.activity)
            )
            .lineStyle(StrokeStyle(lineWidth: 3))
            .foregroundStyle(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .black, location: 0.0),
                        .init(color: .black, location: cuttingPoint),
                        .init(color: .gray, location: cuttingPoint),
                        .init(color: .gray, location: 1.0),
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            
            if let selectedData = selectedActivityData {
                RuleMark(x: .value("Selected", selectedData.date))
                    .foregroundStyle(.green.opacity(0.35))
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [3]))
                    .annotation(position: .top) {
                        Text(selectedData.date, format: .dateTime.day().month(.abbreviated))
                            .font(.caption)
                            .foregroundStyle(.green)
                    }
                PointMark(
                    x: .value("Date", selectedData.date),
                    y: .value("Activity", selectedData.activity)
                )
                .foregroundStyle(.green.opacity(0.5))
                .symbolSize(100)
                
            }
        }
        .frame(height: 90)
        .chartYAxis(.hidden)
        .gesture(
            DragGesture()
                .onChanged { value in
                    isDragging = true
                    updateSelection(at: value.location)
                    let chartWidth: CGFloat = UIScreen.main.bounds.width - 32
                    cuttingPoint = normalizedProgress(forX: value.location.x, chartWidth: chartWidth)
                }
                .onEnded { _ in
                    cuttingPoint = 1.0
                    isDragging = false
                    currentSelection = activityData.last?.date
                }
        )
        .onAppear {
            generateSampleData()
        }
    }
    
    private var selectedActivityData: ActivityData? {
        guard let currentSelection = currentSelection else { return nil }
        return activityData.min {
            abs($0.date.timeIntervalSince(currentSelection)) <
                abs($1.date.timeIntervalSince(currentSelection))
        }
    }
    
    private func updateSelection(at location: CGPoint) {
        let chartWidth: CGFloat = UIScreen.main.bounds.width - 32
        let progress = normalizedProgress(forX: location.x, chartWidth: chartWidth)
        
        let dataIndex = Int(progress * Double(activityData.count - 1))
        let clampedIndex = max(0, min(activityData.count - 1, dataIndex))
        
        if clampedIndex < activityData.count {
            currentSelection = activityData[clampedIndex].date
        }
    }
    
    private func normalizedProgress(forX x: CGFloat, chartWidth: CGFloat) -> CGFloat {
        let raw = max(0, min(1, x / chartWidth))
        return layoutDirection == .rightToLeft ? (1 - raw) : raw
    }
    
    private func generateSampleData() {
        let calendar = Calendar.current
        let today = Date()
        activityData = (0..<30).compactMap { dayOffset in
            guard let date = calendar.date(byAdding: .day, value: -dayOffset, to: today) else {
                return nil
            }
            let randomVariation = Double.random(in: -1.5...2.5)
            return ActivityData(date: date, activity: randomVariation)
        }.reversed()
        currentSelection = activityData.last?.date
    }
}

// Preview
struct UserActivityChart_Previews: PreviewProvider {
    static var previews: some View {
        UserActivityChart()
            .frame(height: 300)
            .padding()
    }
}
