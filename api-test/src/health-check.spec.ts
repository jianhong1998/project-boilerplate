import axiosInstance from './config/axios';

describe('Health Check', () => {
  it('should return status 200', async () => {
    try {
      const result = await axiosInstance.get('/');

      expect(result.status).toBe(200);
    } catch (error) {
      expect(error).toBeUndefined();
    }
  });
});
