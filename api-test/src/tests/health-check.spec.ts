import axiosInstance from '../config/axios';
import { IHealthCheckResDTO } from '@project/types';

describe('Health Check', () => {
  it('should return status 200', async () => {
    try {
      const result = await axiosInstance.get('/');

      expect(result.status).toBe(200);
      expect(result.data).toMatchObject({
        isHealthy: true,
        timestamp: expect.any(String) as string,
      } as IHealthCheckResDTO);
    } catch (error) {
      expect(error).toBeUndefined();
    }
  });
});
