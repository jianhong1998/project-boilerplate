import { IHealthCheckResDTO } from '@project/types';

export class HealthCheckResDTO implements IHealthCheckResDTO {
  public isHealthy: boolean;

  constructor(params: { isHealthy: boolean }) {
    this.isHealthy = params.isHealthy;
  }
}
