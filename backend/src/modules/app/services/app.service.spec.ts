import { AppService } from './app.service';

describe('#getHello', () => {
  it('should return "Hello World!"', () => {
    const appService = new AppService();
    const result = appService.healthCheck();

    expect(result).toBe('Hello World!');
  });
});
