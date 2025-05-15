import pandas as pd
import numpy as np
import os

def preprocess_health_data():
    # Get the base directory of the project
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    
    # Load mock data with absolute paths
    health_data = pd.read_csv(os.path.join(base_dir, 'data/raw/health/mock_outbreak_data.csv'))
    climate_data = pd.read_csv(os.path.join(base_dir, 'data/raw/climate/mock_climate_data.csv'))

    # Merge datasets on 'Region' and 'Date'
    merged_data = pd.merge(
        health_data,
        climate_data,
        on=['Region', 'Date'],
        how='inner'
    )
    
    # Save processed data with absolute path
    output_path = os.path.join(base_dir, 'data/processed/merged_data.csv')
    os.makedirs(os.path.dirname(output_path), exist_ok=True)  # Create directory if it doesn't exist
    merged_data.to_csv(output_path, index=False)
    print(f"Processed data saved to: {output_path}")
    return merged_data

if __name__ == "__main__":
    preprocess_health_data()