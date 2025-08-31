export class HealthCheckResDTO {
  public isHealthy: boolean;

  constructor(params: { isHealthy: boolean }) {
    this.isHealthy = params.isHealthy;
  }
}
