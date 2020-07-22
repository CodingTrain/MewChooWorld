// The Flock (a list of Boid objects)

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    boolean first = true;
    for (Boid b : boids) {
      b.run(boids, first);  // Passing the entire list of boids to each boid individually
      first = false;
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }
}
