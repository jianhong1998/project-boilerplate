import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AppConfig } from './app.config';
import { CommonModule } from './modules/common/common.module';

@Module({
  imports: [AppConfig.configModule, AppConfig.typeormModule, CommonModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
