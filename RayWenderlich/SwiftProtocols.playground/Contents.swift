protocol Bird {
	var name: String { get }
	var canFly: Bool { get }
}

protocol Flyable {
	var airspeedVelocity: Double { get }
}

struct FlappyBird: Bird, Flyable {
	let name: String
	let flappyAmplitude: Double
	let flappyFrequency: Double
	
	var airspeedVelocity: Double {
		return 3 * flappyFrequency * flappyAmplitude
	}
}

struct Penguin: Bird {
	let name: String
}

extension Bird {
	// Flyable birds can fly!
	var canFly: Bool { return self is Flyable }
}

struct SwiftBird: Bird, Flyable {
	var name: String { return "Swift \(version)" }
	let version: Double
	
	// Swift is FASTER every version!
	var airspeedVelocity: Double { return version * 1000.0 }
}