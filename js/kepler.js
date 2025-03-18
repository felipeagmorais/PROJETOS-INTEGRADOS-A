class KeplerSecondLaw {
    constructor(canvas, centerX, centerY, scaledA, scaledB, starX, starY) {
        this.canvas = canvas;
        this.ctx = canvas.getContext('2d');
        this.centerX = centerX;
        this.centerY = centerY;
        this.scaledA = scaledA;
        this.scaledB = scaledB;
        this.starX = starX;
        this.starY = starY;
        this.sectors = [];
        this.colors = ["#FFB74D88", "#64B5F688", "#F0629288"];
        this.measurementInterval = 3000; // 3 segundos
        this.nextMeasurement = Date.now();
    }

    calculateArea(p1, p2) {
        const dx1 = p1.x - this.starX;
        const dy1 = p1.y - this.starY;
        const dx2 = p2.x - this.starX;
        const dy2 = p2.y - this.starY;
        return Math.abs(dx1 * dy2 - dx2 * dy1) / 2;
    }

    update(planetX, planetY, trueAnomaly) {
        const now = Date.now();
        
        if (now >= this.nextMeasurement && this.sectors.length < 3) {
            const point = {
                x: planetX,
                y: planetY,
                angle: trueAnomaly,
                time: now
            };

            if (this.sectors.length > 0) {
                const lastPoint = this.sectors[this.sectors.length - 1];
                const area = this.calculateArea(lastPoint, point);
                this.updateMeasurements(area, now - lastPoint.time);
            }

            this.sectors.push(point);
            this.nextMeasurement = now + this.measurementInterval;
        }

        if (this.sectors.length >= 3 && now > this.nextMeasurement) {
            this.sectors = [];
            this.nextMeasurement = now;
        }
    }

    draw() {
        for (let i = 0; i < this.sectors.length - 1; i++) {
            this.drawSector(this.sectors[i], this.sectors[i + 1], this.colors[i]);
        }
    }
}

export default KeplerSecondLaw;
