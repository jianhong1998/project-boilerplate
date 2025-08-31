import { IHealthCheckResDTO } from '@claim-submission-app/types';

export class HealthCheckResDTO implements IHealthCheckResDTO {
  public isHealthy: boolean;

  constructor(params: { isHealthy: boolean }) {
    this.isHealthy = params.isHealthy;
  }
}
